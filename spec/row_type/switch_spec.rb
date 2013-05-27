describe "Switch Row" do
  tests_row :switch

  it "should initialize with correct settings" do
    @row.object.class.should == Formotion::RowType::SwitchRow
  end

  # Value
  it "should be off by default" do
    cell = @row.make_cell
    cell.accessoryView.on?.should == false
  end

  it "should be on when true" do
    @row.value = true
    cell = @row.make_cell
    cell.accessoryView.on?.should == true
  end

  it "should bind its switch" do
    @row.value = true
    cell = @row.make_cell

    @row.value = false
    cell.accessoryView.on?.should == false
  end

  it "should respond to on_change_callback" do
    @row.on_change_callback.should == nil
    @row.on_change do |c|
      puts "Row has been changed"
    end
    @row.on_change_callback.should.not == nil
  end
end