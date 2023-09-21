using System.Collections;
using System.Collections.Generic;
using com.onexr.app;
using com.onexr.framework;
using com.onexr.models;
using com.onexr.views;
using UnityEngine;

namespace com.onexr.controllers
{
    public class LoginController : BaseController<LoginView, LoginModel>
    {
        public override void Disabled()
        {
            // Remove Button Pointers
            view.loginButton.onClick.RemoveAllListeners();

            // Save and do any final things before we turn off
            if (model.saveInfo)
            {
                SetSavedLogin(model);
            }
        }

        public override void Enabled()
        {
            // Update Button Listeners
            view.loginButton.onClick.AddListener(Login);

            // Set fields
            model = GetSavedLogin();
            view.usernameInput.text = model.username;
            view.passwordInput.text = model.password;
            view.saveInfoToggle.isOn = model.saveInfo;
        }

        #region Save and Load from model

        LoginModel GetSavedLogin()
        {
            LoginModel model = new LoginModel();

            string uname = PlayerPrefs.GetString(AppConstants.Keys.USERNAME, "");
            model.username = uname;
            string pass = PlayerPrefs.GetString(AppConstants.Keys.PASSWORD, "");
            model.password = pass;

            return model;
        }

        void SetSavedLogin(LoginModel model)
        {
            PlayerPrefs.SetString(AppConstants.Keys.USERNAME, model.username);
            PlayerPrefs.SetString(AppConstants.Keys.PASSWORD, model.password);
        }

        #endregion

        #region User actions
        void Login()
        {
            Debug.Log(view.usernameInput.text);

            model.username = view.usernameInput.text;
            model.password = view.passwordInput.text;
            model.saveInfo = view.saveInfoToggle.isOn;

            AppManager.Instance.SetLoading(true);

            model.Authenticate();

            //model.username, model.password
            StartCoroutine(LoginCoroutine());
        }

        IEnumerator LoginCoroutine()
        {
            /*
            // Enable loading to tell the user something is happening and cover up any other input from being entered
            AppManager.Instance.SetLoading(true);

            // Send request to backend or database with the username/password // Wait for response
            yield return new WaitForSeconds(1);

            // Disable loading
            AppManager.Instance.SetLoading(false);

            //if (success)
            AppManager.Instance.OpenScreen("MainMenu");
            */

            yield return new WaitForSeconds(1);

        }

        void Back()
        { 
            AppManager.Instance.OpenScreen("LoginRegisterMenu");
        }

        #endregion
    }

}