class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == "busca"
    return true if controller == "devise/sessions"
    return true if controller == "devise/registrations"
    return true if controller == "omniauth_callbacks"

    # return true if controller == "users" && action.in?(%w[new create])
    return true if controller == "analises" && action.in?(%w[index show])
    return true if controller == "fornecedors" && action.in?(%w[index show])
    return true if controller == "produtos" && action.in?(%w[index show])
    return true if controller == "omniauth_callback"
    return true if controller == "comentarios" && action.in?(%w[index show])


    if user
      return true if controller == "analises" && action != "destroy"
      return true if controller == "comentarios" && action != "destroy"

      # return true if controller == "users" && action.in?(%w[edit update])
      return true if user.admin?
    end
    false
  end
end