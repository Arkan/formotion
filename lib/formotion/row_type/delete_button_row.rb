motion_require 'button'

module Formotion
  module RowType
    class DeleteButtonRow < ButtonRow

      def build_cell(cell)
        super
        cell.textLabel.textColor = 0xFF332A.uicolor
      end

      def on_delete_pressed
        self.row.on_tap_callback.call(self.row) if self.row.on_tap_callback
      end
    end
  end
end
