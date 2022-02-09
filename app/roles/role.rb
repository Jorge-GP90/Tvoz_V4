class Role
  def self.options_for_enum 
    { student: 0,
      teacher: 1,
    }
  end
  def self.options_for_role
    role_status = []
    self.options_for_enum.each do | key, value |
      role_status.push([("#{key}"), key])
    end
    return role_status
  end
end