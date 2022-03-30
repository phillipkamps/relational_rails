# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Player.destroy_all
Team.destroy_all

@team_united = Team.create!(name: "United", rank: 5, won_championship: true)
@team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
@team_liverpool = Team.create!(name: "Liverpool", rank: 2, won_championship: true)

@player_pogba = Player.create!(name: "Pogba", age: 28, injured: true, team_id: @team_united.id)
@player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: @team_united.id)
@player_pulisic = Player.create!(name: "Pulisic", age: 22, injured: true, team_id: @team_chelsea.id)
@player_havertz = Player.create!(name: "Havertz", age: 26, injured: false, team_id: @team_chelsea.id)
@player_salah = Player.create!(name: "Salah", age: 29, injured: true, team_id: @team_liverpool.id)
@player_virgil = Player.create!(name: "Virgil", age: 31, injured: false, team_id: @team_liverpool.id)
