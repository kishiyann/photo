# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    password_confirmation { '00000000' }
  end
end
