class SaveUser < User::SaveOperation
    permit_columns github_username
end