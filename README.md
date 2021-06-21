### db

Adjust `db/config.yml` and then `rake db:create db:migrate`

### some CLI crud:

`bundle exec ruby app/main.rb "{\"action\":\"index\"}"`
`bundle exec ruby app/main.rb "{\"action\":\"create\",\"params\":{\"title\":\"Ruby\",\"body\":\"has arrived\",\"published\":false}}"`
`bundle exec ruby app/main.rb "{\"action\":\"update\",\"params\":{\"id\": 1, \"title\":\"edited\",\"body\":\"and updated\",\"published\":false}}"`
`bundle exec ruby app/main.rb "{\"action\":\"destroy\",\"params\":{\"id\":4}}"`