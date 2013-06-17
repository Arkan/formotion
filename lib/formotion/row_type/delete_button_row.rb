motion_require 'button'

module Formotion
  module RowType
    class DeleteButtonRow < ButtonRow

      def build_cell(cell)
        super
        delete_button = UIButton.buttonWithType(UIButtonTypeCustom)
        delete_button.frame = cell.frame.tap do |f|
          f.origin.x = Formotion::RowType::Base.field_buffer / 2
          f.size.width -= Formotion::RowType::Base.field_buffer
          if UIDevice.currentDevice.systemVersion < "7.0"
            f.size.height += 2 # To remove the bottom line of the Cell
          end
        end
        delete_button.setTitle(cell.textLabel.text, forState: UIControlStateNormal)
        delete_button.setBackgroundImage(UIImage.imageNamed("formotion/button_red.png"), forState:UIControlStateNormal)
        delete_button.titleLabel.font = UIFont.boldSystemFontOfSize(16)
        delete_button.titleLabel.color = UIColor.whiteColor
        delete_button.autoresizingMask = UIViewAutoresizingNone | UIViewAutoresizingFlexibleWidth
        delete_button.addTarget(self, action: :on_delete_pressed, forControlEvents: UIControlEventTouchUpInside)
        delete_button.backgroundColor = UIColor.clearColor
        cell.backgroundColor = UIColor.clearColor
        cell.addSubview(delete_button)
      end

      def on_delete_pressed
        self.row.on_tap_callback.call(self.row) if self.row.on_tap_callback
      end
    end
  end
end
