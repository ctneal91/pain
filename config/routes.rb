Rails.application.routes.draw do
  get 'visits/new'

  root 'prescriptions#index'
  get 'prescriptions/:id' => 'prescriptions#show', as: :prescription

  #doses
  get 'prescriptions/:prescription_id/doses' => 'doses#index', as: :doses
  get 'prescriptions/:prescription_id/doses/:id' => 'doses#show', as: :dose
  get 'prescriptions/:prescription_id/add_dose' => 'doses#new', as: :new_dose
  post 'prescriptions/:prescription_id/doses' => 'doses#create'

  #Overall Sign In path
  get '/sign_in' => 'sessions#patient_or_doctor', as: :overall_sign_in

  # Patient Sign In and Out Routes
  get '/patient_sign_in' => 'sessions#newpatient', as: :patient_sign_in
  post '/patient_sign_in' => 'sessions#create_patient'
  delete '/patient_sign_out' => 'sessions#destroy_patient', as: :patient_sign_out

  # Patient Sign Up Routes
  get '/patient_sign_up' => 'patients#new', as: :patient_sign_up
  post '/patient_sign_up' => 'patients#create', as: :patients

  #Doctor Sign In and Out Routes
  get '/doctor_sign_in' => 'sessions#newdoctor', as: :doctor_sign_in
  post '/doctor_sign_in' => 'sessions#create_doctor'
  delete '/doctor_sign_out' => 'sessions#destroy_doctor', as: :doctor_sign_out

  # Doctor Sign Up and edit
  get '/doctor_sign_up' => 'doctors#new', as: :doctor_sign_up
  post '/doctor_sign_up' => 'doctors#create', as: :doctors

  #Doctor Views patients
  get 'doctor/:id/patients' => 'doctors#patients', as: :doctor_view_patients
  get 'doctor/:id/patient/:patient_id' => 'doctors#patient', as: :doctor_view_patient
  get 'doctor/:id/patient/:patient_id/prescription/:prescription_id'=> 'doctors#prescription', as: :doctor_view_prescription
  get 'doctor/:id/patient/:patient_id/new_prescription' => 'doctors#new_prescription', as: :new_prescription
  post 'doctor/:id/patient/:patient_id/prescription' => 'doctors#create_prescription', as: :prescriptions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
