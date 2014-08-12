require 'spec_helper'

describe Division do
  it "has many employees" do
    division = Division.create({:name => "Finance"})
    employee1 = Employee.create({:name => "Bob Smith", :division_id => division.id})
    employee2 = Employee.create({:name => "Jane Meyer", :division_id => division.id})
    division.employees.should eq [employee1, employee2]
  end

  it 'returns division ID when given a division name' do
    division = Division.create({:name => "Finance"})
    employee1 = Employee.create({:name => "Bob Smith", :division_id => division.id})

end
