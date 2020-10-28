defmodule Todolist.GroupTest do
  use Todolist.DataCase

  alias Todolist.Group

  describe "teams" do
    alias Todolist.Group.Team

    @valid_attrs %{team_name: "some team_name"}
    @update_attrs %{team_name: "some updated team_name"}
    @invalid_attrs %{team_name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Group.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Group.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Group.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Group.create_team(@valid_attrs)
      assert team.team_name == "some team_name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Group.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = Group.update_team(team, @update_attrs)
      assert team.team_name == "some updated team_name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Group.update_team(team, @invalid_attrs)
      assert team == Group.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Group.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Group.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Group.change_team(team)
    end
  end
end
