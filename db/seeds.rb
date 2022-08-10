# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Social.create(title: 'Reddit', logo: '/reddit.png') unless Social.where(title: 'Reddit').present?
Social.create(title: 'Telegram', logo: '/telegram.png') unless Social.where(title: 'Telegram').present?
Social.create(title: 'Snapchat', logo: '/snapchat.png') unless Social.where(title: 'Snapchat').present?
Social.create(title: 'Instagram', logo: '/instagram.png') unless Social.where(title: 'Instagram').present?
Social.create(title: 'Facebook', logo: '/facebook.png') unless Social.where(title: 'Facebook').present?
Social.create(title: 'Tiktok', logo: '/tiktok.png') unless Social.where(title: 'Tiktok').present?
Social.create(title: 'Youtube', logo: '/youtube.png') unless Social.where(title: 'Youtube').present?
Social.create(title: 'Twitter', logo: '/twitter.png') unless Social.where(title: 'Twitter').present?
Social.create(title: 'Discord', logo: '/discord.png') unless Social.where(title: 'Discord').present?
Social.create(title: 'Twitch', logo: '/twitch.png') unless Social.where(title: 'Twitch').present?
Social.create(title: 'Site Internet', logo: '/web.png') unless Social.where(title: 'Site Internet').present?
Social.create(title: 'Autre', logo: '/more.png') unless Social.where(title: 'Autre').present?

Product.create(title: 'Mentorat ECommerce', logo: '/ecom.png', description: nil, content: nil, rem: nil, marketing: nil, criterion: nil, status: nil, bonus: nil, cpf: nil) unless Product.where(title: 'Mentorat ECommerce').present?
