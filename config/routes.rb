BooherFamily::Application.routes.draw do

  namespace :blog do
    resources :tags
    resources :posts
  end

  resources :journal_entries

  resources :components

  resources :reps

  resources :exercises

  resources :crossfit_workouts

  mount Ckeditor::Engine => '/ckeditor'

  scope module: "trip_planning" do
    resources :locations
    resources :trips do
      resources :trip_days do
        resources :trip_meals
        resources :activities
      end
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
    scope module: "sonship" do
      resources :sonship_classes
    end
    scope module: "properties" do
      resources :goals
      resources :lost_items
      resources :workouts
    end
  end

  scope module: "sonship" do
    resources :sonship_classes do
      resources :sonship_lessons
    end
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
  match "calendar/find_duration/:start_time/:end_time", to: "calendar#find_duration"
  get "calendar/build_week"
  post "calendar/add_week"

  root :to => 'home#index'

end
