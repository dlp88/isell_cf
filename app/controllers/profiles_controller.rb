class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.new
    # @course = Course.new(course_params)

    # Create course based on school --> course association
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      # Show successful flash message and redirect
      flash[:notice] = "Profile was successfully created."
      redirect_to profile_path(@profile)
    else
        render :new
      # Render new templates
    end
  end

  def index
    @profile = Profile.all
  end

  def show
    @profile = current_user.profile
  end

  def edit
     @profile = Profile.find(params[:id])
  end

private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :biography, :picture)
  end

end
