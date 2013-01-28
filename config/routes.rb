BooherFamily::Application.routes.draw do


  resources :journal_entries

  resources :components

  resources :reps

  resources :exercises

  resources :crossfit_workouts

  mount Ckeditor::Engine => '/ckeditor'

  resources :locations

  resources :trips do
    resources :trip_days do
      resources :trip_meals
      resources :activities
    end
  end

  resources :principles
  resources :family_goals

  get "home/index"
  get "calendar/work_history"

  devise_for :users, controllers: { registrations: "registrations" }

  resources :events

  get "expenses/settlement"
  post "expenses/settle_up"
  resources :expenses

  resources :users do
    resources :goals
    resources :lost_items
    resources :workouts
    resources :sonship_classes
  end

  resources :sonship_classes do
    resources :sonship_lessons
  end

  resources :sonship_lessons do
    resources :sonship_questions
  end

  # calendar views
  match "calendar/index(/month/:month_string)", to: "calendar#index", as: :calendar_display
  match "calendar/populate/:month_string", to: "calendar#populate"
  match "calendar/empty_out_month/:month_string", to: "calendar#empty_out_month"
  match "calendar/serve_events/", to: "calendar#serve_events"
  match "calendar/weekly_hours/:week_start", to: "calendar#weekly_hours"
  get "calendar/build_week"
  post "calendar/add_week"

  root :to => 'home#index'

end
