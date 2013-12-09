# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Pipeline::Application.config.secret_key_base = '8bb2715622f9738b9f6203fe7c568a31988f736dd4c943e0acd67968fb087f9558275a3d7a6aa21f1d7c55057f035584aaadb61103e7830b8c04ca83b091c947'
