module SessionHelpers
  def login_teacher(teacher)
    post '/test/session', params: { teacher_id: teacher.id }
  end
end
