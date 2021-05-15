require 'rails_helper'

RSpec.describe Hero,type: :model do
    let(:name){ 'Homem Aranha' }
    subject { Hero.new(name: name) }

    describe 'validations com shoulda' do
        it { should validate_presence_of(:name) }
        it { should validate_length_of(:name).is_at_least(4) }
        it { should validate_uniqueness_of(:name).case_insensitive }
    end
    describe 'validations convencional(sem shoulda)' do
        it 'Cria um hero válido' do
            hero = Hero.new(name: 'Thor')
            expect(hero).to be_valid
        end
        it 'Cria um hero inválido' do
            hero = Hero.new()
            expect(hero).not_to be_valid
        end
    end
    describe 'scopes' do
        it '.by_token' do
            expect(Hero.where('name LIKE ?', "%#{name}%").to_sql).to eq Hero.search(name).to_sql
        end
        it '.sorted_by_name' do
            expect(Hero.order(:name).to_sql).to eq Hero.sorted_by_name.to_sql
        end
    end
end