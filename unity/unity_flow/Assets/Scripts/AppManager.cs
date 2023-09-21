using System.Collections.Generic;
using com.onexr.controllers;
using com.onexr.framework;
using com.onexr.models;
using com.onexr.views;
using UnityEngine;

namespace com.onexr.app
{
    public class AppManager : MonoBehaviour
    {
        public static AppManager Instance;

        [SerializeField]
        private string initialScreen = "Workflow";

        [SerializeField]
        private GameObject loadingScreen;

        [SerializeField]
        private List<AppScreen> appScreens = new List<AppScreen>();

        [System.Serializable]
        public struct AppScreen
        {
            public string name;
            public GameObject appScreen;
        }

        [SerializeField]
        private AppScreen activeScreen;

        void Awake()
        {
            Instance = this;
            OpenScreen(initialScreen);
            //activeScreen.appScreen = new LoginController().GetComponent<GameObject>();
            //activeScreen.appScreen = GameObject.FindAnyObjectByType<LoginController<LoginView, LoginModel>>();
        }

        public void OpenScreen(string name)
        {
            for (int i = 0; i < appScreens.Count; i++)
            {
                Debug.Log(appScreens[i].name + ", " + name);
                if (appScreens[i].name.Equals(name))
                {
                    if (activeScreen.appScreen != null)
                        activeScreen.appScreen.gameObject.SetActive(false);

                    activeScreen = appScreens[i];
                    activeScreen.appScreen.gameObject.SetActive(true);
                    break;
                }
            }
        }

        public void SetLoading(bool state)
        {
            loadingScreen.SetActive(state);
        }
    }
}
