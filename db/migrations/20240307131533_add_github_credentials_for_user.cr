class AddGithubCredentialsForUser::V20240307131533 < Avram::Migrator::Migration::V1
  def migrate
    # Read more on migrations
    # https://www.luckyframework.org/guides/database/migrations
    #
    # create table_for(Thing) do
    #   primary_key id : Int64
    #   add_timestamps
    #
    #   add title : String
    #   add description : String?
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"
    alter table_for(User) do
      add github_username : String, unique: false, case_sensitive: true, fill_existing_with: "na"
    end
  end

  def rollback
    alter table_for(User) do
      remove :github_username
    end
  end
end
