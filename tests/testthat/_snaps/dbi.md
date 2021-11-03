# DBI schema works

    Code
      schema("my")
    Output
      [1] "my"
      attr(,"class")
      [1] "schema"

---

    Code
      schema("my") %>% glue_sql("hello {schema}", .con = DBI::ANSI())
    Output
      <SQL> hello 'my'

---

    Code
      schema("my") %>% glue_sql("CREATE SCHEMA {`schema`}", .con = DBI::ANSI())
    Output
      <SQL> CREATE SCHEMA "my"

