require 'spec_helper'

describe Projects do
  it "has many employees" do
    project = Project.create({:name => "mortgage_app"})
    employee1 = project.create({:name => "Bob Smith", :division_id => division.id})
    employee2 = project.create({:name => "Jane Meyer", :division_id => division.id})
    division.projects.should eq [project1, project2]
  end

  it 'returns division ID when given a division name' do
    division = Division.create({:name => "Finance"})
    project1 = project.create({:name => "Bob Smith", :division_id => division.id})
  end
end
