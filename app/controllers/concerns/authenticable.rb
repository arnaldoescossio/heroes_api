module Authenticable
    private

    def authenticate_with_token
        @token ||= request.headers['Authorization']

        unless valid_token?
            render json: { errors: 'Forneça um token'}, status: :unauthorized
        end
    end

    def valid_token?
        @token.present?        
    end
end