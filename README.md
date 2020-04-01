1. Создать стартовую машину
```
vagrant up
```
2. Получить доступ к командной строке
```
vagrant ssh
```
3. В консоли сгенерировать пару ключей
```
ssh-keygen -t rsa -b 2048
```
Ответить на вопросы:
Enter file in which to save the key (/home/vagrant/.ssh/id_rsa): (лучше оставить как есть)
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
4. Получить открытый ключ
```
cat /home/vagrant/.ssh/id_rsa.pub
```
5. Создать машины (Ubuntu 18.04) в облаке, в качестве логина указать admin, для доступа указать полученный открытый ключ
6. Отредактировать /vagrant/inventory.yaml
```
nano /vagrant/inventory.yaml
```
Если машины имеют адреса 1.2.3.4 и 2.3.4.5, то файл получится таким:
```yaml
all:
  hosts:
    1.2.3.4
    2.3.4.5
```
7. Подключиться к каждой удалённой машине
```
ssh admin@1.2.3.4
```
и установить python2:
```
sudo apt-get install python
```
закрыть соединение
```
exit
```
8. Запустить provisioning

Для GitLab
```
ansible-playbook --private-key /home/vagrant/.ssh/id_rsa -i /vagrant/inventory.yaml /vagrant/gitlab-playbook.yaml
```
Для Jenkins
```
ansible-playbook --private-key /home/vagrant/.ssh/id_rsa -i /vagrant/inventory.yaml /vagrant/jenkins-playbook.yaml
```