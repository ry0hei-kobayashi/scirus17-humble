# Sciurus17-humble
sciurus17 humbleをdockerで動かすためのリポジトリ

本家:https://github.com/rt-net/sciurus17_ros

## 環境構築
```
git clone https://github.com/ry0hei-kobayashi/scirus17-humble.git
cd scirus17-humble/env_docker
docker compose build
```

## docker起動
```
docker compose up 
```

docker立ち上げ後に以下のコマンドでコンテナに入る
```
docker exec -it sciurus-humble bash
```

## 実機で開発する
udev_rulesを作成する(初回設定時のみ)
```
ros2 run sciurus17_tools create_udev_rules
```

## simulatorで開発する

gazeboを起動する
```
ros2 launch sciurus17_gazebo sciurus17_with_table.launch.py use_sim_time:=true
```
testプログラムを実行する
```
ros2 launch sciurus17_example example.launch.py example:'pick_and_place_right_arm_waist' use_sim_time:=true
```


## ros2 packageを追加する
additional_rospkgsフォルダ以下に追加のros2 packageを配置する

DockerfileでCOPY, compoes.ymlでvolumeアタッチされるようになっているのでDocker内外で双方向に編集可能
