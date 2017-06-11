# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

perm = Permission.create([{ name: 'administrator'}, {name: 'worker'}, {name: 'poweruser'}])
User.create(name: 'Admin', permission: perm.first )

Status.create([{ name: 'rendelési igény'}, {name: 'megrendelve'}, {name: 'nincs rendelési igény'}])

