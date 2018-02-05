#cloud-config
users:
  - default
  - name: user2
    ssh-authorized-keys:
      - ssh-rsa AWW23w/\RRTTAAB3NzaC1yc2EAAAADAQABAAABAQC6maE472wIrrW5qa9e1YoNJMrwj7Bs/Dd/gYnX+1SZLHNqcvtLDGsScVf0XWvO908645Ig/kbD7RS8dzRxMZd7ZuXDmlFxVLF87puIon9r2456235WG7G3fTGOQSV6p3YB76le1WkfyQ40jxsaRGonflm4QVtl9s0Zrnc/lrSz5QtKynxsM5rwFUbO2+kw+FAA+O+YiW5t2Ri8kz0UgWU1yHH0ynsg4wdYS7TTRs+Z6NQe7H02NuUnTrZZ+qkRIt9KKoGRfpDySXy9O/a8dk/6z8Qwe34ettBf0DEK9wNjdutDto9RzpS8Y1lkuEEWWrtsEUgeIH/jJgTcQTYotEZVZ//\hCd/qMgjyaeXzreR rwildgrube@rwildgrube-lt1
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/bash
