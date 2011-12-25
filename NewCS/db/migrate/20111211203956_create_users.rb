class CreateUsers < ActiveRecord::Migration 
  def change
    begin
      down
      up
    rescue
      up
    end
  end
  
  def up
    create_table :users, :options=>'DEFAULT CHARSET=UTF8' do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :login, :null => false
      t.string :password, :null => false
      t.string :email
      t.string :sex
      t.string :role
      t.string :photo
      
      ##### Students
      t.integer :group_id
      
      ##### Prepod
      t.integer :settings_id
      t.integer :pos
      
      t.timestamps
    end
    
    sql = <<-_SQL
      create trigger `create_settings_for_user` before insert on `users`
      for each row begin
        call create_new_settings(@newid);
        SET NEW.settings_id = @newid;
      end; //

      create trigger `remove_settings_for_user` after delete on `users`
      for each row begin
        call remove_settings(OLD.settings_id);

        call  insert_former_users(OLD.id, OLD.first_name, OLD.second_name, OLD.last_name, OLD.login, OLD.password, OLD.email, OLD.sex, OLD.role, OLD.photo, OLD.group_id, OLD.settings_id, OLD.pos, OLD.created_at , OLD.updated_at);
      end; //

      create PROCEDURE remove_settings (in oldid int)
      begin
        DELETE FROM `settings` WHERE oldid = id;
      end;//

      create PROCEDURE create_new_settings (out newid int)
      begin
        INSERT INTO `settings`(`created_at`, `updated_at`) VALUES (NOW(), NOW());
        SET newid = @@IDENTITY;
      end;//

      create PROCEDURE insert_former_users (in user_id int, in first_name char(255)
      , in second_name char(255), in last_name char(255), in login char(255)
      , in password char(255),in email char(255), in sex char(255), in role char(255)
      , in photo char(255), in group_id int, in settings_id int, in pos int
      , in created_at datetime , in updated_at datetime)
      begin
        INSERT INTO `former_users`(`user_id`, `first_name`, `second_name`, `last_name`, `login`, `password`, `email`, `sex`, `role`, `photo`, `group_id`, `settings_id`, `pos`, `created_at`, `updated_at`) 
            VALUES (user_id, first_name, second_name, last_name, login, password,email, sex, role, photo, group_id, settings_id, pos,created_at , updated_at);
      end;//
    _SQL
    sql.split('//').each do |stmt|
      execute(stmt) if (stmt.strip! && stmt.length > 0)
    end
    
    add_index(:users, :login, :unique => true)
  end
  def down
    drop_table :users
  end
end
