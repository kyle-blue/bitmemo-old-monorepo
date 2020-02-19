
import React from "react";
import ReactDom from "react-dom";
import { createStore, compose, applyMiddleware } from "redux";
import { Provider } from "react-redux";
import thunk from "redux-thunk";
import GlobalStyle from "./styles/GlobalStyle";
import allReducer from "./reducers/index";
import "@babel/polyfill";

function App(): React.ReactElement {
    let storeEnhancers = compose(
        applyMiddleware(thunk),
        // @ts-ignore //
        window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
    );
    let ThemeContext = React.createContext({ theme: null });
    let store = createStore(allReducer, storeEnhancers);


    return (
        <Provider store={store}>
            <GlobalStyle backgroundColor="#c8eafa" color="#000" />
            <ThemeContext.Provider value={{ theme: null }}>
                <h1>Hello World!</h1>
            </ThemeContext.Provider>
        </Provider>
    );
}
ReactDom.render(<App />, document.getElementById("app"));
