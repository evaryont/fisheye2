# == Route Map (Updated 2014-04-12 22:18)
#
#                   Prefix Verb   URI Pattern                        Controller#Action
#                     root GET    /                                  home#index
#         new_user_session GET    /users/sign_in(.:format)           devise/sessions#new
#             user_session POST   /users/sign_in(.:format)           devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
#            user_password POST   /users/password(.:format)          devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)     devise/passwords#edit
#                          PATCH  /users/password(.:format)          devise/passwords#update
#                          PUT    /users/password(.:format)          devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)            registrations#cancel
#        user_registration POST   /users(.:format)                   registrations#create
#    new_user_registration GET    /users/sign_up(.:format)           registrations#new
#   edit_user_registration GET    /users/edit(.:format)              registrations#edit
#                          PATCH  /users(.:format)                   registrations#update
#                          PUT    /users(.:format)                   registrations#update
#                          DELETE /users(.:format)                   registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)      devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format)  devise/confirmations#new
#                          GET    /users/confirmation(.:format)      devise/confirmations#show
#   accept_user_invitation GET    /users/invitation/accept(.:format) devise/invitations#edit
#   remove_user_invitation GET    /users/invitation/remove(.:format) devise/invitations#destroy
#          user_invitation POST   /users/invitation(.:format)        devise/invitations#create
#      new_user_invitation GET    /users/invitation/new(.:format)    devise/invitations#new
#                          PATCH  /users/invitation(.:format)        devise/invitations#update
#                          PUT    /users/invitation(.:format)        devise/invitations#update
#                    users GET    /users(.:format)                   users#index
#                          POST   /users(.:format)                   users#create
#                 new_user GET    /users/new(.:format)               users#new
#                edit_user GET    /users/:id/edit(.:format)          users#edit
#                     user GET    /users/:id(.:format)               users#show
#                          PATCH  /users/:id(.:format)               users#update
#                          PUT    /users/:id(.:format)               users#update
#                          DELETE /users/:id(.:format)               users#destroy
#

Fisheye2::Application.routes.draw do
  root to: 'home#index'
  devise_for :users, skip: :registrations
  devise_scope :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    patch 'users/:id' => 'devise/registrations#update', as: 'user_registration'
  end
  resources :users
end
