FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test01'}
    password_confirmation {password}
    surname               {'てすと'}
    first_name            {'てすと'}
    surname_kana          {'テスト'}
    first_name_kana       {'テスト'}
    date_of_birth         {'2000-1-1'}
  end
end