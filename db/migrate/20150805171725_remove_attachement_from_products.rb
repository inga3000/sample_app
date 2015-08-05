class RemoveAttachementFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :photo_file_name, :string
    remove_column :products, :photo_content_type, :string
    remove_column :products, :photo_file_size, :integer    
    remove_column :products, :photo_updated_at, :datetime

  end
end
