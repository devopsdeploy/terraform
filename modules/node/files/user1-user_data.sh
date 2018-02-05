#cloud-config
users:
  - default
  - name: user1
    ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2ESSVVQQADAQABAAABAQDKJcJnfT3JcTTvvcl6nB2Ht6xS/SMD/9NYuC0nldMatz7NvTo2mQ23werWUFqaNeiRCKQNXI7vjS5Xyq/yBTKz6o7zesieda86VNz7EiHlW2ww23aaxxDpgC2oT6iqqN5GrYfGVVq0QyfkRkiiTf8ITMlRCzZAeXpHPDD8BlFf0lfgLnQVi/m+CUYYI4aAhl5oTCutQJD7D6yudR923wertZo7SNz90D5UApGvB39bhWAKb9o2FZs9qqJzFG7q6zntDKTS3KIkz7x9g7PPIGEjs4pLgUvCW1O1s3QGuJj6pFw1GYU7Pb6-+uuytr+GKz3tqmbeewwxTgKRWYqgYTlxWm7O6WqcfyJV7F/H6l user@domain.com
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/bash
