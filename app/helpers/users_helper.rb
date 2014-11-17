module UsersHelper
  def alertWrongUserForm(obj)
    wrong = "form-control input_short alert alert-danger"
    @user.errors.each do |attr, mesg|
      if attr == obj
        return wrong
      end
    end
    normal = "form-control input_short"
  end
end
