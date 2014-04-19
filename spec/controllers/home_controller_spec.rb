require 'spec_helper'

describe HomeController do

  describe 'unauthenticated' do
    it 'should redirect to login_path' do
      get 'index'
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
