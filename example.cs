using System;
using System.Collections.Generic;
using UnityEngine;

namespace EvolSim
{
    public class MeshyExample : MonoBehaviour
    {
        public int health = 100;
        public string playerName = "Player";
        private List<GameObject> enemies = new List<GameObject>();
        public bool isAlive
        {
            get { return health > 0; }
        }

        void Start()
        {
            health = 100;
            playerName = "DefaultPlayer";
            Debug.Log("Game Started");
            for (int i = 0; i < 10; i++)
            {
                GameObject enemy = new GameObject("Enemy" + i);
                enemies.Add(enemy);
            }
        }

        void Update()
        {
            if (Input.GetKeyDown(KeyCode.Space))
            {
                Jump();
            }
            if (health <= 0 && isAlive)
            {
                Die();
            }
            CheckEnemies();
        }

        public void Jump()
        {
            if (isAlive)
            {
                Debug.Log(playerName + " jumped!");
                GetComponent<Rigidbody>().AddForce(Vector3.up * 10f);
            }
        }

        private void Die()
        {
            Debug.Log("Player died");
            gameObject.SetActive(false);
        }

        private void CheckEnemies()
        {
            foreach (GameObject enemy in enemies)
            {
                if (enemy != null)
                {
                    float distance = Vector3.Distance(transform.position, enemy.transform.position);
                    if (distance < 5f)
                    {
                        TakeDamage(10);
                    }
                }
            }
        }

        public void TakeDamage(int damage)
        {
            health -= damage;
            Debug.Log("Took " + damage + " damage. Health: " + health);
        }
    }
}
