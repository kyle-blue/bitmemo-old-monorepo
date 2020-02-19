import React from "react";

interface Props {
    height: number;
}

function Navbar(Props: props): React.ReactElement {
    const navItems = [<li key="1">Home</li>, <li key="2">About</li>];


    return (
        <section id="navbar">
            {
                navItems
            }
        </section>
    );
}

export default Navbar;
