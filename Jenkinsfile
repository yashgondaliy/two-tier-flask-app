@Library("Shared") _
pipeline{
    agent { label "dev" };
    stages{
        stage("Code"){
            steps{
                script{
                    clone ("https://github.com/yashgondaliy/two-tier-flask-app.git", "master")
                }
            }
        }
        stage("Trivy File System Scan "){
            steps{
                script{
                    trivy_fs()
                }
            }
        }
        stage("Build"){
            steps{
                sh "docker build -t two-tier-flask-app ."
            }
        }
        stage("test"){
            steps{
                echo "tester can write a test code"
            }
        }
        stage("push to Docker Hub"){
            steps{
                script{
                    docker_push ("dockerhubcreds", "two-tier-flask-app")
                }
            }
        }
        stage("deploy"){
            steps{
                sh "docker compose up -d --build flaskapp"
            }
        }
    }
    post{
        success{
            script{
                emailext from: 'yashgondaliya0@gmail.com',
                to: 'yashgondaliya0@gmail.com',
                body: 'Build success',
                subject: 'Build success'
            }
        }
        failure{
            script{
                emailext from: 'yashgondaliya0@gmail.com',
                to: 'yashgondaliya0@gmail.com',
                body: 'Build failed'
                subject: 'Build failed'
            }
        }
    }
}
