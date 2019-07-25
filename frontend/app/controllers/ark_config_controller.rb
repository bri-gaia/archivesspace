class ArkConfigController < ApplicationController

  set_access_control  "manage_repository" => [:edit, :update]

  def edit
    @ark_config = JSONModel(:ark_config).all.first
    @repositories = JSONModel(:repository).all
  end

  def update
    @ark_config = JSONModel(:ark_config).all.first

    handle_crud(:instance => :ark_config,
                :model => JSONModel(:ark_config),
                :replace => false,
                :obj => @ark_config,
                :on_invalid => ->(){ return render :action => :edit },
                :on_valid => ->(id){
                  flash[:success] = I18n.t("ark_config._frontend.action.updated")
                  redirect_to :controller => :ark_config, :action => :edit
                })
  end
end
