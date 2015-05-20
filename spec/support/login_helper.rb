module LoginHelper
  def set_current_user(user)
    session['cas'] = { 'user' => user.name }
  end
end