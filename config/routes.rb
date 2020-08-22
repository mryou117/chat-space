Rails.application.routes.draw do
  # ユーザー登録に必要なルーティングを一気に生成してくれるメソッド。
  # rails g devise 時に自動生成
  devise_for :users
  # root "messages#index"
  root 'groups#index'
  # usersへのパス　編集と更新をルーティング
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update]
end
