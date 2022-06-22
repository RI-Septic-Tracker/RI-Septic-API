# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'Rich',
             city: 'Cumberland',
             address: '123 fake st',
             phone: '123456',
             email: 'email@email.com',
             inspector: false)
User.create!(name: 'Charlie',
             city: 'Cumberland',
             address: '111  different fake st',
             phone: '123456345',
             email: 'email22@email.com',
             inspector: false)
