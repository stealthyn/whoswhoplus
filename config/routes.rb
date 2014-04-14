SampleKoalaRailsApp::Application.routes.draw do
  root :to => 'home#index'

  # サインイン時のコールバック画面
  get '/home/callback' => 'home#callback'

  # サインアウト
  get '/sign_out' => 'home#sign_out'

  # 紹介画面
  get '/relations/:user' => 'relations#index', as: :relations

  # メッセージ送信画面
  get '/relations/:user/via/:via' => 'relations#show', as: :relation

  get 'home/callback' => 'home#callback'

  # 友人の友人一覧表示画面
  get '/friends/:user_fb_id/:fb_id' => 'friends#show', as: :friends

  # 検索結果
  get '/friends/:user_fb_id/:fb_id/search_result' => 'friends#search_result' as: :search_result

  end

  # 開発環境のみのダミーログイン画面
  if Rails.env.development?
    get '/dummy_login' => 'home#dummy_form'
    post '/dummy_login' => 'home#dummy_login'
  end
end
