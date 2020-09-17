Rails.application.routes.draw do
  # ユーザー登録に必要なルーティングを一気に生成してくれるメソッド。
  # rails g devise 時に自動生成
  devise_for :users

  root 'groups#index'

  # usersへのパス 編集と更新をルーティング
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update, :show] do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
