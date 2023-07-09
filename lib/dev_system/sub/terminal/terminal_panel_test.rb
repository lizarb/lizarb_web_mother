class DevSystem::TerminalPanelTest < Liza::PanelTest

  test :subject_class do
    assert subject_class == DevSystem::TerminalPanel
  end

  test_methods_defined do
    on_self 
    on_instance :call, :default, :find, :input, :pallet, :pick_one
  end

  test :settings do
    assert subject_class.log_level == :normal
    assert subject_class.log_color == :green
  end

end
