# reparse_url works

    Code
      reparse_url("superscheme:subscheme://host/path")
    Output
      $scheme
      [1] "superscheme" "subscheme"  
      
      $hostname
      [1] "host"
      
      $port
      NULL
      
      $path
      [1] "path"
      
      $query
      NULL
      
      $params
      NULL
      
      $fragment
      NULL
      
      $username
      NULL
      
      $password
      NULL
      
      attr(,"class")
      [1] "url"

