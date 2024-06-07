import React, { useEffect, useState } from 'react';
import './PizzaList.css'; // Подключаем файл стилей

function PizzaList() {
    const [pizzas, setPizzas] = useState([]);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetch('http://localhost:5002/api/pizzas')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data);
                setPizzas(data);
            })
            .catch(error => {
                console.error('Error fetching pizzas:', error);
                setError('Failed to fetch pizzas. Please try again later.');
            });
    }, []);

    return (
        <div className="pizza-list-container">
            <h1 className="pizza-list-title">Pizza List</h1>
            {error ? (
                <p className="error-message">{error}</p>
            ) : (
                <ul className="pizza-list">
                    {pizzas.map(pizza => (
                        <li key={pizza.id} className="pizza-item">
                            <span className="pizza-name">{pizza.name}</span>
                            <span className="pizza-price">${pizza.price.toFixed(2)}</span>
                        </li>
                    ))}
                </ul>
            )}
        </div>
    );
}

export default PizzaList;
