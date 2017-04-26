defmodule FrenchToastServer.DataTest do
  use FrenchToastServer.DataCase

  alias FrenchToastServer.Data
  alias FrenchToastServer.Data.Level

  @create_level_attrs %{color: "some color", description: "some description", name: "some name"}
  @update_level_attrs %{color: "some updated color", description: "some updated description", name: "some updated name"}
  @invalid_level_attrs %{color: nil, description: nil, name: nil}

  def fixture(:level, attrs \\ @create_level_attrs) do
    {:ok, level} = Data.create_level(attrs)
    level
  end

  test "list_levels/1 returns all levels" do
    level = fixture(:level)
    assert Data.list_levels() == [level]
  end

  test "get_level! returns the level with given id" do
    level = fixture(:level)
    assert Data.get_level!(level.id) == level
  end

  test "create_level/1 with valid data creates a level" do
    assert {:ok, %Level{} = level} = Data.create_level(@create_level_attrs)
    assert level.color == "some color"
    assert level.description == "some description"
    assert level.name == "some name"
  end

  test "create_level/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Data.create_level(@invalid_level_attrs)
  end

  test "update_level/2 with valid data updates the level" do
    level = fixture(:level)
    assert {:ok, level} = Data.update_level(level, @update_level_attrs)
    assert %Level{} = level
    assert level.color == "some updated color"
    assert level.description == "some updated description"
    assert level.name == "some updated name"
  end

  test "update_level/2 with invalid data returns error changeset" do
    level = fixture(:level)
    assert {:error, %Ecto.Changeset{}} = Data.update_level(level, @invalid_level_attrs)
    assert level == Data.get_level!(level.id)
  end

  test "delete_level/1 deletes the level" do
    level = fixture(:level)
    assert {:ok, %Level{}} = Data.delete_level(level)
    assert_raise Ecto.NoResultsError, fn -> Data.get_level!(level.id) end
  end

  test "change_level/1 returns a level changeset" do
    level = fixture(:level)
    assert %Ecto.Changeset{} = Data.change_level(level)
  end
end
