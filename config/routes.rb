BooherFamily::Application.routes.draw do

  namespace :expense_tracker do
    get '/report'
    resources :vendors
    resources :categories
    resources :weeks do
      get "expense_by_categories"
      get "populate_week"
      resources :daily_expenses
    end
  end

  namespace :blog do
    resources :tags
    resources :posts
  end

  get '/journal_entries/data(/:months)', to: 'journal_entries#data'
  put '/journal_entries/form_update/:id' => "journal_entries#form_update"
  get '/journal_entries/report(/:months)', to: 'journal_entries#report', as: :frequency_report

  get '/journal_entries/month_data(/:month_string)', to: 'journal_entries#month_data'
  get '/journal_entries/month_report(/:month_string)', to: 'journal_entries#month_report', as: :month_report
  get '/journal_entries/calendar_report(/:month_string)', to: 'journal_entries#calendar_report', as: :calendar_report

  resources :journal_entries do
    resources :exertions
  end

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

  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "users/omniauth_callbacks" }

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

    resources :sonship_lessons do
      resources :sonship_questions
    end
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
