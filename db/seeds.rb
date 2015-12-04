DatabaseCleaner.clean_with(:truncation)
include FactoryGirl::Syntax::Methods

Timecop.freeze(Time.current - 3.days) do
  # create users
  user_1 = create(:user)
  user_2 = create(:user)
  user_3 = create(:user)
  user_4 = create(:user)
  user_5 = create(:user)

  p "5 users were created."

  # create one team
  team_1 = create(:team, creator: user_1)
  User.all.each do |user|
    team_1.members << user
  end

  p "One team was created and all users joined this team."

  # create projects
  project_1 = create(:project, team: team_1, creator: user_1)
  project_2 = create(:project, team: team_1, creator: user_2)

  [user_1, user_2, user_3].each do |user|
    project_1.users << user
  end

  [user_1, user_4].each do |user|
    project_2.users << user
  end

  p "2 projects were created in team_1."
  p "user_1, user_2 and user_3 joined project_1."
  p "user_1 and user_4 joined project_2."
end

Timecop.freeze(Time.current - 2.days) do
  # create todos
  30.times.each do
    todo = create(:todo)
    todo.assigned!(todo.project.users.sample, todo.project.users.sample)
    todo.estimated!(todo.project.users.sample, [1, 2, 3, 4].sample.days.since)
  end

  p "30 todos were created."
end

Timecop.freeze(Time.current - 1.days) do
  Todo.limit(5).each do |todo|
    create(:comment, target: todo, creator: todo.project.users.sample)
  end

  p '5 comments were leaved for todos.'
end
