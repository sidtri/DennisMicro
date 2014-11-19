class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :ref_to_cookie

    def mobile_device?
        if session[:mobile_param]
            session[:mobile_param] == "1"
        else
            request.user_agent =~ /Mobile|webOS/
        end
    end

    protected

    def ref_to_cookie
        if params[:ref] && !Rails.application.config.ended
            if !User.find_by_referral_code(params[:ref]).nil?
                cookies[:h_ref] = { :value => params[:ref], :expires => 1.week.from_now }
            end

            if request.env["HTTP_USER_AGENT"] and !request.env["HTTP_USER_AGENT"].include?("facebookexternalhit/1.1")
                redirect_to proc { url_for(params.except(:ref)) }  
            end
        end
    end
    def aweber 
        oauth = AWeber::OAuth.new('AkmnOff8pFZ2sOXtdL1WgVel', 'tZNCf6Bc8vtM6YzmaQDb6TWvujwnqAYv30IJy23x')
        #Rather than authorizing with the verification code, we use the token and secret
        oauth.authorize_with_access('AglaJeUdqn51h2xY370tavHl', 'nChyvWf5WcFnZfgQ1DvTU234IyuGxsMfKV03E8Tl')
        aweber = AWeber::Base.new(oauth)
        resale = aweber.account.lists[3565190]
        resale
    end
end
