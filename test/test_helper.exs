if :integration in ExUnit.configuration()[:include] do
  TestingEcto.Repo.start_link()
end

Mox.defmock(TestingEcto.RepoMock, for: Ecto.Repo)
ExUnit.start(exclude: [:integration])
